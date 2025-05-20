function main() {
// JavaScript example
fetch('http://localhost:3000/users/2', {
  headers: {
    'Authorization': 'Bearer your-token-here'
  }
})
.then(response => response.json())
.then(data => console.log(data));
}
main();