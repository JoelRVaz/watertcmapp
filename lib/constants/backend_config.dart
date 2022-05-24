bool aws = true;

String baseUrl = aws
    ? 'http://ec2-54-213-98-148.us-west-2.compute.amazonaws.com'
    : 'http://localhost:8000';
Duration updateTime = const Duration(seconds: 10);
