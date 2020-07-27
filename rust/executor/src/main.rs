use std::process::{Command, Stdio};
use std::collections::HashMap;

fn main() {
    // let mut cmd = Command::new("ls");
    // let mut child = cmd.arg("-lh");
    // println!("{:?}", &child);
    // child.spawn();
    let mut envs = HashMap::new();
    envs.insert(String::from("ANGORA_TRACK_OUTPUT"), String::from("track.log"));
    println!("{:?}", envs);
    let mut cmd = Command::new("ls");
    cmd.arg("-lh").envs(&envs).stderr(Stdio::null());
    println!("{:?}", cmd);
    let output = cmd.output().expect("Error to execute");
    println!("{:?}", output);
}
