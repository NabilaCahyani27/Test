// soal no 1
let n = parseInt(prompt("Masukkan angka: "));
for (let i = 1; i <= n; i++) {
    let angka = i
  if (i % 3 === 0 && i % 4 === 0) {
    angka = "OKYES";
  } else if (i % 3 === 0) {
    angka = "OK";
  } else if (i % 4 === 0) {
    angka = "YES";
  }
  console.log(angka);
}

// soal no 2
let n = parseInt(prompt("Masukkan angka: "));
let string = "";
for (let i = 1; i <= n; i++) {
  for (let j = 1; j <= i; j++) {
    string += i;
  }
  string += "\n";
}
console.log(string);

let string = "";
for (let i = 1; i <= n; i++) {
  for (let j = i; j >= 1 ; j--) {
    string += j;
  }
  string += "\n";
}
console.log(string);

let string = "";
for (let i = 1; i <= n; i++) {
  for (let j = 1; j <= Math.ceil(i / 2); j++) {
    string += j;
  }
  for (let j = Math.floor(i / 2); j >= 1; j--) {
    string += j;
  }
  string += "\n";
}
console.log(string);

let string = "";
for (let i = 1; i <= 5; i++) {
    for (let j=0; j < 5; j++) {
        string += (i + j * n) + "\t";
    }
    string += "\n";
}
console.log(string);

//soal no 3
let n = [12,9,13,6,10,4,7,2]
for (let i = 0; i < n.length; i++) {
    if (n[i] % 3 === 0) {
        n.splice(i, 1);
        i--;
    }
}
n.sort((a, b) => a - b);
console.log(n);
