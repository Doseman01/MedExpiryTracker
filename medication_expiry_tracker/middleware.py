class AppPoolMiddleware:
    """
    Adds X-App-Pool header to indicate if this is Blue or Green environment.
    """

    def __init__(self, get_response):
        self.get_response = get_response
        # Set the environment: 'blue' or 'green'
        # You can also use environment variables for flexibility
        import os
        self.app_pool = os.getenv("APP_POOL", "medapp_blue")

    def __call__(self, request):
        response = self.get_response(request)
        response["X-App-Pool"] = self.app_pool
        return response

