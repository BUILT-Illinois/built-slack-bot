import urllib.parse
from commands.hello import handle_hello_command

def lambda_handler(event, context):
    """
    Main Lambda entry point. Handles incoming Slack events or commands.
    """
    # Verify Slack request
    if not verify_slack_request(event):
        return {"statusCode": 403, "body": "Invalid signature"}

    # Parse Slack command payload
    body = urllib.parse.parse_qs(event.get("body", ""))
    command = body.get("command", [""])[0]
    text = body.get("text", [""])[0]
    user = body.get("user_name", [""])[0]

    payload = {"text": text, "user_name": user}

    # Route based on command
    if command == "/bot" or command == "/bot-hello":
        return handle_hello_command(payload)

    # Default fallback
    return {
        "statusCode": 200,
        "body": "Command not recognized. Try `/bot hello`."
    }