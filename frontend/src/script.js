// Main JavaScript file for frontend logic
document.addEventListener("DOMContentLoaded", function () {
    // URL of my Azure Function API
    const apiUrl = 'https://mycloudresumefunctionapp.azurewebsites.net/api/GetVisitorCount?code=0vL-uXrgnyu84ocIi6QHZAd4vrnCqzEDXSnsxOE94lyCAzFuwRkvlQ%3D%3D';

    // Fetch the visitor count from the API
    fetch(apiUrl)
        .then(response => {
            if (!response.ok) {
                throw new Error('Network response was not ok');
            }
            return response.text();  // Read the response as text
        })
        .then(data => {
            // Parse and update the visitor count on the webpage
            document.getElementById('count').innerText = data;
        })
        .catch(error => {
            console.error('Error fetching visitor count:', error);
            document.getElementById('count').innerText = "Error loading visitor count";
        });
});
