# Node.js Server Side Cookie Notes

## Setting up a basic Node.js server

1. Install Node.js and npm if you haven't already.
2. Create a new directory for your project and navigate into it.
3. Initialize a new Node.js project:
    ```sh
    npm init -y
    ```
4. Install the necessary packages:
    ```sh
    npm install express cookie-parser
    ```

## Creating a basic server with Express

1. Create a file named `server.js` and add the following code:

    ```javascript
    const express = require('express');
    const cookieParser = require('cookie-parser');
    const app = express();
    const port = 3000;

    app.use(cookieParser());

    app.get('/', (req, res) => {
      res.send('Hello World!');
    });

    app.listen(port, () => {
      console.log(`Server is running on http://localhost:${port}`);
    });
    ```

## Setting a cookie

1. To set a cookie, modify the `app.get` route in `server.js`:

    ```javascript
    app.get('/set-cookie', (req, res) => {
      res.cookie('name', 'value', { maxAge: 900000, httpOnly: true });
      res.send('Cookie has been set');
    });
    ```

## Reading a cookie

1. To read a cookie, modify the `app.get` route in `server.js`:

    ```javascript
    app.get('/get-cookie', (req, res) => {
      let cookie = req.cookies['name'];
      res.send(`Cookie value: ${cookie}`);
    });
    ```

## Deleting a cookie

1. To delete a cookie, modify the `app.get` route in `server.js`:

    ```javascript
    app.get('/delete-cookie', (req, res) => {
      res.clearCookie('name');
      res.send('Cookie has been deleted');
    });
    ```

## Running the server

1. Start the server by running:
    ```sh
    node server.js
    ```
2. Open your browser and navigate to `http://localhost:3000/set-cookie` to set a cookie.
3. Navigate to `http://localhost:3000/get-cookie` to read the cookie.
4. Navigate to `http://localhost:3000/delete-cookie` to delete the cookie.