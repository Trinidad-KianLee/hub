<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/daisyui@2.31.0/dist/full.css" rel="stylesheet">
    <style>
        /* Force white background and black text for input fields */
        input {
            background-color: white !important;
            color: black !important;
        }
    </style>
</head>
<body class="bg-gray-100 relative flex justify-center items-center min-h-screen">
    <!-- Blurred Background Images -->
    <div class="absolute top-0 left-0 w-full h-full flex">
        <img src="Picture 1.jpeg" alt="Picture 1" class="w-1/3 h-full object-cover blur-md opacity-30">
        <img src="Picture 2.jpeg" alt="Picture 2" class="w-1/3 h-full object-cover blur-md opacity-30">
        <img src="Picture 3.jpg" alt="Picture 3" class="w-1/3 h-full object-cover blur-md opacity-30">
    </div>

    <!-- Login Form -->
    <div class="relative w-full max-w-md p-10 bg-white bg-opacity-90 rounded-lg shadow-lg">
        <h2 class="text-3xl font-bold text-center text-gray-800 mb-6">Login</h2>
        <form action="login" method="POST" class="space-y-6">
            <div>
                <label for="email" class="block text-sm font-medium text-gray-700">Email</label>
                <input type="email" id="email" name="email" class="input input-bordered w-full focus:ring-blue-800 focus:border-blue-800" placeholder="Enter your email" required>
            </div>

            <div>
                <label for="password" class="block text-sm font-medium text-gray-700">Password</label>
                <input type="password" id="password" name="password" class="input input-bordered w-full focus:ring-blue-800 focus:border-blue-800" placeholder="Enter your password" required>
            </div>

            <div class="text-center">
                <button type="submit" class="btn bg-blue-800 hover:bg-blue-600 text-white w-full font-bold py-2">Login</button>
            </div>

            <!-- Additional Links -->
            <div class="text-center mt-4">
                <a href="forgot-password.jsp" class="text-sm text-blue-600 hover:underline">Forgot your password?</a>
            </div>
        </form>
    </div>
</body>
</html>
