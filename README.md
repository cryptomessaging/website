# Copy website to s3

$ cd ~/cryptomessaging/website
$ rm -rf public; hugo
$ aws s3 rm s3://cryptomessaging.org --recursive  --profile mobido
$ aws s3 cp ~/cryptomessaging/website/public s3://cryptomessaging.org/ --recursive --profile mobido


# Set the S3 bucket to public read

1) Open S3 Management
2) Select bucket with your websit data
3) Click Permissions tab
4) Click bucket policy
5) Paste in JSON from below:

{
  "Version": "2008-10-17",
  "Statement": [
    {
      "Sid": "AllowPublicRead",
      "Effect": "Allow",
      "Principal": {
        "AWS": "*"
      },
      "Action": [
        "s3:GetObject"
      ],
      "Resource": [
        "arn:aws:s3:::cryptomessaging.org/*"
      ]
    }
  ]
}

# Running hugo

For full rebuilds on change
$ hugo server --disableFastRender