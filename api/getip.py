import socket

def get_ip_address():
    try:
        hostname = socket.gethostname()
        ip_address = socket.gethostbyname(hostname)
        return ip_address
    except Exception as e:
        return f"Unable to get IP address: {e}"
if  __name__ =="__main__":
    print("IP Address:", get_ip_address())
