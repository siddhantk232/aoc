const DIGITS: [&str; 20] = [
    "zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "0", "1", "2",
    "3", "4", "5", "6", "7", "8", "9",
];

#[allow(dead_code)]
pub fn solve(input: String) -> u32 {
    input
        .lines()
        .map(|l| {
            let mut nums = l.chars().filter_map(|c| c.to_digit(10));

            let x = nums.next().unwrap();
            let y = nums.last().unwrap_or(x);

            let num = x * 10 + y;

            dbg!(num);

            num
        })
        .fold(0u32, |acc, c| acc + c)
}

fn find_digit(line: &str, rev: bool) -> Option<u64> {
    let mut min_position = None;
    let mut min_digit = None;

    for digit in &DIGITS {
        if rev {
            if let Some(position) = line.rfind(digit) {
                if position >= min_position.unwrap_or(position) {
                    min_position = Some(position);
                    min_digit = Some(digit);
                }
            }
        } else if let Some(position) = line.find(digit) {
            if position <= min_position.unwrap_or(position) {
                min_position = Some(position);
                min_digit = Some(digit);
            }
        }
    }

    min_digit.map(|digit| match *digit {
        "zero" => 0,
        "one" => 1,
        "two" => 2,
        "three" => 3,
        "four" => 4,
        "five" => 5,
        "six" => 6,
        "seven" => 7,
        "eight" => 8,
        "nine" => 9,
        n => n.parse::<u64>().unwrap(),
    })
}

pub fn solve2(input: String) -> u64 {
    input
        .lines()
        .map(|line: &str| {
            let first = find_digit(line, false).unwrap();
            let last = find_digit(line, true).unwrap();
            first * 10 + last
        })
        .sum()
}
