const fs = require("fs/promises");

async function getSum() {
  const text = await fs.readFile("input.txt", {encoding: "utf8"});
  let sum = [];
  let s = 0;
  text.split("\n").forEach(line => {
    if (line === "") {
      sum.push(s);
      s = 0;
      return;
    }
    s += parseInt(line);
  });
  sum = sum.sort((a, b) => b - a);
  return sum;
}

async function main() {
  const sum = await getSum();

  // part one
  console.log(sum[0]);

  // part two
  console.log(sum[0] + sum[1] + sum[2]);
}

main();
