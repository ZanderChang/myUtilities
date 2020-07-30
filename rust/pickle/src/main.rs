use std::collections::BTreeMap;
use std::fs::File;
use std::io::{Write, BufWriter};
use std::env;
use serde_pickle::{to_vec, from_slice};

fn main() {
    let mut map = BTreeMap::new();
    map.insert("x".to_string(), 1.0);
    map.insert("y".to_string(), 2.0);

    // Serialize the map into a pickle stream.
    // The second argument selects pickle version 3.
    let serialized = to_vec(&map, true).unwrap();

    println!("{:?}", serialized);

    let args : Vec<String> = env::args().collect();
    let f = File::create(&args[1]).expect("create failed");
    let mut file = BufWriter::new(f);
    file.write_all(&serialized).expect("write failed");

    // Deserialize the pickle stream back into a map.
    // Because we compare it to the original `map` below, Rust infers
    // the type of `deserialized` and lets serde work its magic.
    let deserialized = from_slice(&serialized).unwrap();

    println!("{:?}", deserialized);

    assert_eq!(map, deserialized);
}