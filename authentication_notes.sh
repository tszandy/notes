JWT
Using JSON Web Tokens (JWT) for authentication is a common approach in modern web applications, allowing you to securely manage user sessions. Here’s how you can implement both front-end and back-end authentication with JWT:
JWT Structure: A JWT consists of three parts: Header, Payload, and Signature. It looks like this: xxxxx.yyyyy.zzzzz.
    Header: Contains metadata about the type of token and the algorithm used to sign it.
    Payload: Contains the claims, which are statements about an entity (typically, the user) and additional data.
    Signature: Used to verify the token’s authenticity.
JWT Flow:
    The user logs in with credentials.
    The server verifies the credentials and issues a JWT.
    The front-end stores the JWT (usually in local storage or cookies).
    The front-end sends the JWT with each request to the back-end.
    The back-end verifies the JWT and, if valid, processes the request.

how to do Token management (e.g., expiration, refreshing, revocation).
    Token management is a critical aspect of implementing secure token-based authentication systems. This involves handling token expiration, refreshing tokens, and revoking tokens when necessary. Here's how you can effectively manage tokens:

    1. Token Expiration
    Tokens should have a limited lifespan to reduce the risk of misuse if they are compromised.

    Setting Expiration
    Short-lived Access Tokens: Typically, access tokens are short-lived (e.g., 15 minutes to 1 hour).
    Longer Expiration for Refresh Tokens: Refresh tokens have a longer lifespan (e.g., a few days to a few weeks) and are used to obtain new access tokens.

    Implementation
    When generating the token, specify an expiration time:

    ```javascript
    const accessToken = jwt.sign({ userId: user._id }, process.env.JWT_SECRET, {
    expiresIn: '15m', // 15 minutes expiration
    });

    const refreshToken = jwt.sign({ userId: user._id }, process.env.REFRESH_TOKEN_SECRET, {
    expiresIn: '7d', // 7 days expiration
    });
    ```
    On the back-end, check the token’s expiration time during each request:

    ```javascript
    jwt.verify(token, process.env.JWT_SECRET, (err, decoded) => {
    if (err) {
        if (err.name === 'TokenExpiredError') {
        return res.status(401).send('Token expired');
        }
        return res.status(401).send('Invalid token');
    }
    req.userId = decoded.userId;
    next();
    });
    ```
    2. Token Refreshing
    Token refreshing is used to extend the session without requiring the user to re-authenticate frequently.

    Refresh Token Strategy
    Issue a refresh token alongside the access token when the user logs in.
    Store the refresh token securely, typically in an HTTP-only cookie or encrypted storage.
    When the access token expires, the client sends the refresh token to obtain a new access token.
    Implementation
    Create an endpoint for refreshing tokens:
    javascript
    Copy code
    app.post('/refresh-token', (req, res) => {
    const { refreshToken } = req.body;
    if (!refreshToken) return res.status(403).send('Refresh token is required.');

    jwt.verify(refreshToken, process.env.REFRESH_TOKEN_SECRET, (err, decoded) => {
        if (err) return res.status(403).send('Invalid refresh token.');

        const newAccessToken = jwt.sign({ userId: decoded.userId }, process.env.JWT_SECRET, {
        expiresIn: '15m',
        });

        res.json({ accessToken: newAccessToken });
    });
    });
    Client-side handling:
    When the access token expires, the client detects this (usually via a 401 response) and automatically requests a new access token using the refresh token.
    javascript
    Copy code
    async function fetchWithToken(url, options) {
    let response = await fetch(url, options);

    if (response.status === 401) {
        const refreshToken = localStorage.getItem('refreshToken');
        const refreshResponse = await fetch('/refresh-token', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({ refreshToken }),
        });

        if (refreshResponse.ok) {
        const { accessToken } = await refreshResponse.json();
        localStorage.setItem('accessToken', accessToken);
        options.headers['Authorization'] = `Bearer ${accessToken}`;
        response = await fetch(url, options);
        } else {
        // Handle refresh token failure (e.g., redirect to login)
        }
    }

    return response;
    }

    3. Token Revocation
    Revoking tokens is essential for scenarios like user logout, account compromise, or session invalidation.

    Strategy for Revocation
    Blacklist Approach: Maintain a blacklist of revoked tokens in the database. Each request checks if the token is in the blacklist.
    Token Versioning: Store a version or unique identifier in the token and the user’s record. On revocation, update the version, and invalidate all tokens with the old version.
    Short-lived Tokens: Combine short-lived access tokens with refresh tokens, making access token revocation less critical.
    Implementation
    Blacklist Approach:
    javascript
    Copy code
    const revokedTokens = new Set();

    app.post('/logout', (req, res) => {
    const token = req.headers['authorization'];
    revokedTokens.add(token);
    res.send('Logged out successfully');
    });

    const verifyToken = (req, res, next) => {
    const token = req.headers['authorization'];
    if (revokedTokens.has(token)) return res.status(403).send('Token has been revoked.');

    jwt.verify(token, process.env.JWT_SECRET, (err, decoded) => {
        if (err) return res.status(401).send('Invalid token.');
        req.userId = decoded.userId;
        next();
    });
    };
    Token Versioning:
    Add a tokenVersion field to the user model.
    Increment the tokenVersion whenever tokens are revoked, and include this in the JWT payload.
    javascript
    Copy code
    const newToken = jwt.sign(
    { userId: user._id, tokenVersion: user.tokenVersion },
    process.env.JWT_SECRET,
    { expiresIn: '15m' }
    );
    On each request, verify that the tokenVersion in the token matches the user’s current tokenVersion in the database.
    4. Best Practices
    Use HTTPS: Ensure all tokens are transmitted over HTTPS to prevent interception.
    HTTP-Only Cookies: Store refresh tokens in HTTP-only cookies to protect against XSS attacks.
    Secure Storage: Avoid storing tokens in places accessible via JavaScript (like localStorage) unless absolutely necessary.
    Monitor and Log: Log access and token usage to detect suspicious activities.
    Regularly Rotate Secrets: Change JWT secrets periodically and revoke all tokens on critical changes.
    By effectively managing token expiration, refreshing, and revocation, you can maintain a secure and user-friendly authentication system.

    