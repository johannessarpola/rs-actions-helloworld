use std::env;

fn main() {

    let who_to_greet = match env::var("INPUT_WHO_TO_GREET") {
        Ok(val) => val,
        Err(_e) => "none".to_string(),
    };

    println!("Hello, {who_to_greet}!");
}
