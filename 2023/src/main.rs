mod day1;

fn main() {
    let input = std::fs::read_to_string("day1/input.txt").expect("input file must exist");

    println!("{}", day1::solve2(input.to_string()));
}
