from django.http import HttpResponseServerError

def chaos_start(request):
    return HttpResponseServerError("Simulated failure")

