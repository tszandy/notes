
# Surfshark WireGuard Custom Configuration Guide

This guide walks you through generating a key pair on Surfshark, obtaining server peer details, configuring custom DNS servers, and assembling your `surfshark.conf` file.

---

## Step 1: Generate Private & Public Key Pair

1. Go to the [Surfshark Manual Setup Page](https://my.surfshark.com/vpn/manual-setup/main/wireguard/own-key).
2. Log in with your Surfshark account credentials.
3. Select **I don't have a key pair** (or click **Generate a new key pair**).
4. Enter a name for your device (e.g., `MacBook-WireGuard`).
5. Click **Generate key pair**.
6. **Copy and safely store your Private Key**.

> ⚠️ **Warning:** Surfshark will only display your **Private Key** once. If you lose it, you will need to generate a new key pair.

---

## Step 2: Select Server Location & Get Peer Info

1. On the same page, scroll down to the **Locations** section.
2. Search for and select your desired server location (e.g., *United States - New York*, *Japan - Tokyo*).
3. Copy the following connection details provided for that server:
* **Server Public Key** (`PublicKey`)
* **Server Endpoint Address & Port** (`Endpoint`, e.g., `82.140.187.27:51820`)



---

## Step 3: Change DNS Server Settings

By default, Surfshark assigns its internal DNS servers (`162.252.172.57`, `149.154.159.92`). If you prefer custom or privacy-focused DNS (such as `194.169.169.169`), replace the `DNS` field under the `[Interface]` block in your configuration.

---

## Step 4: Create Your `surfshark.conf` File

Open your terminal or a text editor and create a file named `surfshark.conf`. Insert your generated **PrivateKey** into the template below:

```ini
[Interface]
Address = 10.14.0.2/16
PrivateKey = <YOUR_GENERATED_PRIVATE_KEY>
DNS = 194.169.169.169

[Peer]
PublicKey = P0vaGUOUE7V5bbGOYY2WgQeZnTZEHvIr+dfebU7W4Ao=
AllowedIPs = 0.0.0.0/0
Endpoint = 82.140.187.27:51820
PersistentKeepalive = 25

```

> 💡 **Tip:** The `PersistentKeepalive = 25` parameter is optional but recommended to keep NAT connections alive over inactive periods.

---

## Step 5: Start the Connection

Save the file and run the following command in your terminal from the directory containing `surfshark.conf`:

```bash
sudo wg-quick up ./surfshark.conf

```

### Verify Connection & Public IP

```bash
curl ifconfig.me

```

### Disconnect VPN

```bash
sudo wg-quick down ./surfshark.conf

```