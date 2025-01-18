<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Register</title>
  <link href="dist/output.css" rel="stylesheet"> 
</head>
<body class="bg-gradient-to-r from-blue-500 to-indigo-600 flex items-center justify-center min-h-screen">
  <div class="bg-white shadow-2xl rounded-lg p-8 w-full max-w-lg">
    <h2 class="text-3xl font-bold text-center text-gray-800 mb-6">Register</h2>
    <form action="/register" method="POST">
     
      <div class="mb-4">
        <label for="firstName" class="block text-sm font-medium text-gray-700">First Name</label>
        <input
          type="text"
          id="firstName"
          name="firstName"
          class="mt-1 block w-full px-4 py-2 bg-gray-100 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500 hover:bg-gray-50"
          placeholder="Enter your first name"
          required
        />
      </div>

      <div class="mb-4">
        <label for="lastName" class="block text-sm font-medium text-gray-700">Last Name</label>
        <input
          type="text"
          id="lastName"
          name="lastName"
          class="mt-1 block w-full px-4 py-2 bg-gray-100 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500 hover:bg-gray-50"
          placeholder="Enter your last name"
          required
        />
      </div>

    
      <div class="mb-4">
        <label for="email" class="block text-sm font-medium text-gray-700">Email</label>
        <input
          type="email"
          id="email"
          name="email"
          class="mt-1 block w-full px-4 py-2 bg-gray-100 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500 hover:bg-gray-50"
          placeholder="Enter your email"
          required
        />
      </div>

 
      <div class="mb-4">
        <label for="password" class="block text-sm font-medium text-gray-700">Password</label>
        <input
          type="password"
          id="password"
          name="password"
          class="mt-1 block w-full px-4 py-2 bg-gray-100 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500 hover:bg-gray-50"
          placeholder="Enter your password"
          required
        />
      </div>

      <!-- Confirm Password -->
      <div class="mb-4">
        <label for="confirmPassword" class="block text-sm font-medium text-gray-700">Confirm Password</label>
        <input
          type="password"
          id="confirmPassword"
          name="confirmPassword"
          class="mt-1 block w-full px-4 py-2 bg-gray-100 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500 hover:bg-gray-50"
          placeholder="Confirm your password"
          required
        />
      </div>

      <!-- PUP Branch Dropdown -->
      <div class="mb-4">
        <label for="branch" class="block text-sm font-medium text-gray-700">PUP Branch</label>
        <select
          id="branch"
          name="branch"
          class="mt-1 block w-full px-4 py-2 bg-gray-100 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
          required
        >
          <option value="" disabled selected>Select a branch</option>
          <option value="manila">PUP Manila</option>
          <option value="quezon-city">PUP Quezon City</option>
          <option value="sta-mesa">PUP Sta. Mesa</option>
          <!-- Add more branches as needed -->
        </select>
      </div>

      <!-- Submit Button -->
      <div class="mt-6">
        <button
          type="submit"
          class="w-full bg-blue-600 text-white py-3 px-4 rounded-md shadow-md hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:ring-offset-2"
        >
       Register
        </button>
      </div>
    </form>
  </div>
</body>
</html>
