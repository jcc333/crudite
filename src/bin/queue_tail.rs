extern crate redis;

fn main() {
    let client = redis::Client::open("redis://127.0.0.1/").unwrap();
    let mut con = client.get_connection().unwrap();
    let mut pubsub = con.as_pubsub();
    pubsub.psubscribe("*").unwrap();
    loop {
        let msg = pubsub.get_message().unwrap();
        let payload: String = msg.get_payload().unwrap();
        println!("channel '{}': {}", msg.get_channel_name(), payload);
    }
}

