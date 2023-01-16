resource "aws_cloudfront_cache_policy" "cloudfront" {
  name        = "cf-policy"
  comment     = "test comment"
  default_ttl = 50
  max_ttl     = 100
  min_ttl     = 1
  parameters_in_cache_key_and_forwarded_to_origin {
    cookies_config {
      cookie_behavior = "whitelist"
      cookies {
        items = ["example1"]
      }
    }
    headers_config {
      header_behavior = "whitelist"
      headers {
        items = ["example2"]
      }
    }
    query_strings_config {
      query_string_behavior = "whitelist"
      query_strings {
        items = ["example3"]
      }
    }
  }
}