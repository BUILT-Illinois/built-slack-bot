import json

def handle_hello_command(payload):
    """
    Example Slack command handler.
    payload: dict containing Slack command data (parsed from request body)
    """
    user = payload.get("user_name", "there")
    text = payload.get("text", "").strip()

    # Respond dynamically based on user input
    if text:
        message = f"👋 Hi {user}! You said: '{text}'"
    else:
        message = f"👋 Hello {user}, hope you're having a great day!"

    # Slack expects a JSON response
    return {
        "statusCode": 200,
        "headers": {"Content-Type": "application/json"},
        "body": json.dumps({
            "response_type": "in_channel",  # or "ephemeral" for private replies
            "text": message
        })
    }