
function main() {
    // *** WORKS ***
    // JavaScript example
    fetch('http://localhost:3000/users?_page=0&_perPage=10&_sort=lastName', {
    headers: {
        'Authorization': 'Bearer your-token-here'
    }
    })
    .then(response => response.json())
    .then(data => console.log(data));
}
main();