<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/daisyui@2.31.0/dist/full.css" rel="stylesheet">
    <style>
        /* Force white background and black text for input fields */
        input, select {
            background-color: white !important;
            color: black !important;
        }
    </style>
    <script>
        function validateForm(event) {
            const firstName = document.getElementById("firstName").value.trim();
            const lastName = document.getElementById("lastName").value.trim();
            const email = document.getElementById("email").value.trim();
            const password = document.getElementById("password").value.trim();
            const confirmPassword = document.getElementById("confirmPassword").value.trim();
            const pupBranch = document.getElementById("pupBranch").value;

            // Validate empty fields
            if (!firstName || !lastName || !email || !password || !confirmPassword || pupBranch === "Choose your campus") {
                alert("All fields are required!");
                return false;
            }

            // Validate email format
            const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (!emailPattern.test(email)) {
                alert("Please enter a valid email address.");
                return false;
            }

            // Validate password strength
            const passwordPattern = /^(?=.*[!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?]).{8,}$/;
            if (!passwordPattern.test(password)) {
                alert("Password must be at least 8 characters long and include at least one special character.");
                return false;
            }

            // Validate password confirmation
            if (password !== confirmPassword) {
                alert("Passwords do not match.");
                return false;
            }

            // All validations passed
            return true;
        }
    </script>
</head>
<body class="bg-gray-100 relative flex justify-center items-center min-h-screen">
    <!-- Blurred Background Images -->
    <div class="absolute top-0 left-0 w-full h-full flex">
        <img src="Picture 1.jpeg" alt="Picture 1" class="w-1/3 h-full object-cover blur-md opacity-30">
        <img src="Picture 2.jpeg" alt="Picture 2" class="w-1/3 h-full object-cover blur-md opacity-30">
        <img src="Picture 3.jpg" alt="Picture 3" class="w-1/3 h-full object-cover blur-md opacity-30">
    </div>

    <!-- Register Form -->
    <div class="relative w-full max-w-5xl p-10 bg-white bg-opacity-90 rounded-lg shadow-lg flex flex-col md:flex-row items-center">
        <!-- Left Section with Illustration -->
        <div class="md:w-1/2 p-5 flex items-center justify-center">
            <img src="Picture 1.jpeg" alt="Illustration" class="h-64 md:h-auto object-cover rounded-lg">
        </div>

        <!-- Right Section with Form -->
        <div class="md:w-1/2 p-8">
            <h2 class="text-3xl font-bold text-center text-red-800 mb-6">Register</h2>
            <form action="register" method="POST" class="space-y-6" onsubmit="return validateForm();">
                <div class="flex space-x-4">
                    <div class="w-1/2">
                        <label for="firstName" class="block text-sm font-medium text-gray-700">First Name</label>
                        <input type="text" id="firstName" name="firstName" class="input input-bordered w-full focus:ring-red-800 focus:border-red-800" placeholder="Enter your first name" required>
                    </div>
                    <div class="w-1/2">
                        <label for="lastName" class="block text-sm font-medium text-gray-700">Last Name</label>
                        <input type="text" id="lastName" name="lastName" class="input input-bordered w-full focus:ring-red-800 focus:border-red-800" placeholder="Enter your last name" required>
                    </div>
                </div>

                <div>
                    <label for="email" class="block text-sm font-medium text-gray-700">Email</label>
                    <input type="email" id="email" name="email" class="input input-bordered w-full focus:ring-red-800 focus:border-red-800" placeholder="Enter your email" required>
                </div>

                <div>
                    <label for="password" class="block text-sm font-medium text-gray-700">Password</label>
                    <input type="password" id="password" name="password" class="input input-bordered w-full focus:ring-red-800 focus:border-red-800" placeholder="Enter your password" required>
                </div>

                <div>
                    <label for="confirmPassword" class="block text-sm font-medium text-gray-700">Confirm Password</label>
                    <input type="password" id="confirmPassword" name="confirmPassword" class="input input-bordered w-full focus:ring-red-800 focus:border-red-800" placeholder="Confirm your password" required>
                </div>

                <div>
                    <label for="pupBranch" class="block text-sm font-medium text-gray-700">Select Campus</label>
                    <select id="pupBranch" name="pupBranch" class="select select-bordered w-full focus:ring-red-800 focus:border-red-800" required>
                        <option disabled selected>Choose your campus</option>
                        <option value="PUP-Taguig">PUP-Taguig</option>
                        <option value="PUP-Sta. Mesa">PUP-Sta. Mesa</option>
                        <option value="PUP-Zamboanga">PUP-Zamboanga</option>
                    </select>
                </div>

                <div class="flex space-x-4">
                    <button type="submit" class="btn bg-red-800 hover:bg-red-600 text-white w-1/2 font-bold">Register</button>
                    <a href="login.jsp" class="btn bg-gray-300 hover:bg-gray-400 text-gray-700 w-1/2 font-bold text-center">Sign In</a>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
