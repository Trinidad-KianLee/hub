module.exports = {
  content: [
    "./src/main/webapp/**/*.jsp",
    "./src/**/*.html",           
    "./public/**/*.html",         
  ],
  theme: {
    extend: {},
  },
  plugins: [
	require('daisyui'),
  ],
};
