use std::{collections::HashMap, env, fs, io, path::Path};
use serde_derive::{Deserialize, Serialize};
use bincode::{deserialize_from};

#[derive(Debug, Clone, Default, Copy, Serialize, Deserialize)]
#[repr(C)]
pub struct CondStmtBase {
    pub cmpid: u32,
    pub context: u32,
    pub order: u32,
    pub belong: u32, // 对应输入的Id

    pub condition: u32,
    pub level: u32,
    pub op: u32,
    pub size: u32,

    pub lb1: u32, // clang label
    pub lb2: u32,

    pub arg1: u64,
    pub arg2: u64,
}

impl PartialEq for CondStmtBase {
    fn eq(&self, other: &CondStmtBase) -> bool {
        self.cmpid == other.cmpid && self.context == other.context && self.order == other.order
    }
}

impl Eq for CondStmtBase {}

#[derive(Serialize, Deserialize, PartialEq, Eq, Debug, Clone, Copy, Hash)]
#[repr(C)] 
pub struct TagSeg {
    pub sign: bool,
    pub begin: u32,
    pub end: u32,
} 

#[derive(Serialize, Deserialize, PartialEq, Debug)]
pub struct LogData {
    pub cond_list: Vec<CondStmtBase>, // 条件语句列表
    pub tags: HashMap<u32, Vec<TagSeg>>, // clang label -> offsets (label -> bit vector)
    pub magic_bytes: HashMap<usize, (Vec<u8>, Vec<u8>)>, // variables
}

pub fn get_log_data(path: &Path) -> io::Result<LogData> {
    let f = fs::File::open(path)?;
    if f.metadata().unwrap().len() == 0 {
        return Err(io::Error::new(io::ErrorKind::Other, "Could not find any interesting constraint!, Please make sure taint tracking works or running program correctly."));
    }
    let mut reader = io::BufReader::new(f);
    match deserialize_from::<&mut io::BufReader<fs::File>, LogData>(&mut reader) {
        Ok(v) => Ok(v),
        Err(_) => Err(io::Error::new(io::ErrorKind::Other, "bincode parse error!")),
    }
}

fn main() {
    let args: Vec<String> = env::args().collect();
    assert_eq!(args.len(), 2);
    let path = Path::new(&args[1]);
    if let Ok(v) = get_log_data(&path) {
        println!("cond_list: {}", v.cond_list.len());
        println!("tags: {}", v.tags.len());
        println!("magic_bytes: {}", v.magic_bytes.len());

        for num in 0..v.cond_list.len() {
            println!("{}: {:?}", num, v.cond_list[num]);
        } 

        for (key, value) in v.tags {
            println!("{}: {:?}", key, value);
        }

        for (key, value) in v.magic_bytes {
            println!("{}: {:?} {:?}", key, value.0, value.1);
        }
    }
}
