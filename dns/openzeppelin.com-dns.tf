resource "aws_route53_zone" "openzeppelin_com" {
  name = "openzeppelin.com"
}

resource "aws_route53_record" "openzeppelin_com_nameservers" {
  allow_overwrite = true
  name            = "openzeppelin.com"
  ttl             = 30
  type            = "NS"
  zone_id         = "${aws_route53_zone.openzeppelin_com.zone_id}"

  records = [
    "${aws_route53_zone.openzeppelin_com.name_servers.0}",
    "${aws_route53_zone.openzeppelin_com.name_servers.1}",
    "${aws_route53_zone.openzeppelin_com.name_servers.2}",
    "${aws_route53_zone.openzeppelin_com.name_servers.3}",
  ]
}

resource "aws_route53_record" "openzeppelin_com_soa" {
  allow_overwrite = true
  name            = "openzeppelin.com"
  ttl             = 900
  type            = "SOA"
  zone_id         = "${aws_route53_zone.openzeppelin_com.zone_id}"

  records = [
    "${aws_route53_zone.openzeppelin_com.name_servers.0}. awsdns-hostmaster.amazon.com. 1 7200 900 1209600 86400"
  ]
}

resource "aws_route53_record" "openzeppelin_com_website" {
  zone_id = "${aws_route53_zone.openzeppelin_com.zone_id}"
  name    = "openzeppelin.com"
  ttl     = "300"
  type    = "A"
  records = [local.netlify_ip]
}

resource "aws_route53_record" "openzeppelin_com_www" {
  zone_id = "${aws_route53_zone.openzeppelin_com.zone_id}"
  name    = "www.openzeppelin.com"
  ttl     = 300
  type    = "CNAME"
  records = ["openzeppelin.netlify.com"]
}

resource "aws_route53_record" "openzeppelin_com_google_mx" {
  zone_id = "${aws_route53_zone.openzeppelin_com.zone_id}"
  name    = "openzeppelin.com"
  ttl     = "300"
  type    = "MX"
  records = [
    "5 alt1.aspmx.l.google.com.",
    "5 alt2.aspmx.l.google.com.",
    "1 aspmx.l.google.com.",
    "10 alt3.aspmx.l.google.com.",
    "10 alt4.aspmx.l.google.com."
  ]
}

resource "aws_route53_record" "openzeppelin_com_txt" {
  zone_id = "${aws_route53_zone.openzeppelin_com.zone_id}"
  name    = "openzeppelin.com"
  ttl     = "300"
  type    = "TXT"
  records = [
    "v=spf1 include:_spf.google.com ~all",
    "v=DMARC1; p=quarantine; rua=mailto:dmarc-reports@openzeppelin.com",
    "google-site-verification=30do8MGZ29CQX6R0H5hs3Y09SUYuLIt1fbrHWBeJg98",
    "ethbuenosaires.com._report._dmarc.openzeppelin.com",
    "openzeppelin.org._report._dmarc.openzeppelin.com",
    "zeppelin.solutions.com._report._dmarc.openzeppelin.com"
  ]
}

resource "aws_route53_record" "openzeppelin_com_docs" {
  zone_id = "${aws_route53_zone.openzeppelin_com.zone_id}"
  name    = "docs.openzeppelin.com"
  ttl     = 300
  type    = "CNAME"
  records = ["openzeppelin-docs.netlify.com"]
}

resource "aws_route53_record" "openzeppelin_com_forum" {
  zone_id = "${aws_route53_zone.openzeppelin_com.zone_id}"
  name    = "forum.openzeppelin.com."
  ttl     = "300"
  type    = "CNAME"
  records = [
    "zeppelin.hosted-by-discourse.com"
  ]
}

resource "aws_route53_record" "openzeppelin_com_blog_nameservers" {
  name            = "blog.openzeppelin.com"
  ttl             = 30
  type            = "NS"
  zone_id         = "${aws_route53_zone.openzeppelin_com.zone_id}"

  records = [
    "ns1.wordpress.com.",
    "ns2.wordpress.com.",
    "ns3.wordpress.com."
  ]
}

resource "aws_route53_record" "openzeppelin_com_crafty" {
  zone_id = "${aws_route53_zone.openzeppelin_com.zone_id}"
  name    = "crafty.openzeppelin.com"
  type    = "A"
  alias {
    name                   = "d36f6jlxd1t7vv.cloudfront.net."
    zone_id                = "Z2FDTNDATAQYW2"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "openzeppelin_com_crafty_aws_certificate_validation" {
  zone_id = "${aws_route53_zone.openzeppelin_com.zone_id}"
  name    = "_0379fa5c217950dbe5318563126043d2.crafty.openzeppelin.com."
  ttl     = "300"
  type    = "CNAME"
  records = [
    "_a5d12adbe04eea7290525bf60e7318a6.duyqrilejt.acm-validations.aws."
  ]
}

resource "aws_route53_record" "openzeppelin_com_ethernaut" {
  zone_id = "${aws_route53_zone.openzeppelin_com.zone_id}"
  name    = "ethernaut.openzeppelin.com"
  ttl     = 300
  type    = "CNAME"
  records = ["openzeppelin-ethernaut.netlify.com"]
}

resource "aws_route53_record" "openzeppelin_com_ethernaut_solidity-05" {
  zone_id = "${aws_route53_zone.openzeppelin_com.zone_id}"
  name    = "solidity-05.ethernaut.openzeppelin.com"
  ttl     = 300
  type    = "CNAME"
  records = ["solidity-05--openzeppelin-ethernaut.netlify.com"]
}

resource "aws_route53_record" "openzeppelin_com_ethernaut_ropsten" {
  zone_id = "${aws_route53_zone.openzeppelin_com.zone_id}"
  name    = "ropsten.ethernaut.openzeppelin.com"
  ttl     = 300
  type    = "CNAME"
  records = ["ropsten--openzeppelin-ethernaut.netlify.com"]
}

resource "aws_route53_record" "openzeppelin_com_gsn-chat-app" {
  zone_id = "${aws_route53_zone.openzeppelin_com.zone_id}"
  name    = "gsn-chat-app.openzeppelin.com"
  ttl     = 300
  type    = "CNAME"
  records = ["gsn-chat-app.netlify.com"]
}

resource "aws_route53_record" "openzeppelin_com_gsn" {
  zone_id = "${aws_route53_zone.openzeppelin_com.zone_id}"
  name    = "gsn.openzeppelin.com"
  ttl     = 300
  type    = "CNAME"
  records = ["gifted-mayer-c163b8.netlify.com"]
}

resource "aws_route53_record" "openzeppelin_com_simple-poll" {
  zone_id = "${aws_route53_zone.openzeppelin_com.zone_id}"
  name    = "simple-poll.openzeppelin.com"
  ttl     = 300
  type    = "CNAME"
  records = ["clever-kowalevski-d01bac.netlify.com"]
}

resource "aws_route53_record" "openzeppelin_com_erc20-verifier" {
  zone_id = "${aws_route53_zone.openzeppelin_com.zone_id}"
  name    = "erc20-verifier.openzeppelin.com"
  ttl     = 300
  type    = "CNAME"
  records = ["erc20-verifier.netlify.com"]
}

resource "aws_route53_record" "openzeppelin_com_identity-recovery-demo" {
  zone_id = "${aws_route53_zone.openzeppelin_com.zone_id}"
  name    = "identity-recovery-demo.openzeppelin.com"
  ttl     = 300
  type    = "CNAME"
  records = ["identity-recovery-demo.netlify.com"]
}

resource "aws_route53_record" "openzeppelin_com_proxy-explorer" {
  zone_id = "${aws_route53_zone.openzeppelin_com.zone_id}"
  name    = "proxy-explorer.openzeppelin.com"
  ttl     = 300
  type    = "CNAME"
  records = ["openzeppelin-proxy-explorer.netlify.com"]
}

resource "aws_route53_record" "openzeppelin_com_starter-kit-demo" {
  zone_id = "${aws_route53_zone.openzeppelin_com.zone_id}"
  name    = "starter-kit-demo.openzeppelin.com"
  ttl     = 300
  type    = "CNAME"
  records = ["openzeppelin-starter-kit-demo.netlify.com"]
}

resource "aws_route53_record" "openzeppelin_com_defender_aws_certificate_validation" {
  zone_id = "${aws_route53_zone.openzeppelin_com.zone_id}"
  name    = "_172f7f32804e73c58f0527b62ce55afa.defender.openzeppelin.com."
  ttl     = 300
  type    = "CNAME"
  records = ["_aadf41056f9db0b343ea50a6cb224267.tfmgdnztqk.acm-validations.aws."]
}

resource "aws_route53_record" "openzeppelin_com_defender" {
  zone_id = "${aws_route53_zone.openzeppelin_com.zone_id}"
  name    = "defender.openzeppelin.com"
  type    = "A"
  alias {
    name  = "d2sypkyx96x9wx.cloudfront.net"
    zone_id = "Z2FDTNDATAQYW2"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "openzeppelin_com_defender_api_aws_certificate_validation" {
  zone_id = "${aws_route53_zone.openzeppelin_com.zone_id}"
  name    = "_9c0b7c10ff44e16b6d9aa3e0aa275ce6.api.defender.openzeppelin.com."
  ttl     = 300
  type    = "CNAME"
  records = ["_7d4365eeb5abef937ba18cf4ccfd4d43.jfrzftwwjs.acm-validations.aws."]
}

resource "aws_route53_record" "openzeppelin_com_defender_api" {
  zone_id = "${aws_route53_zone.openzeppelin_com.zone_id}"
  name    = "api.defender.openzeppelin.com."
  ttl     = 300
  type    = "CNAME"
  records = ["api.defender.openzeppelin.com.cdn.cloudflare.net"]
}

resource "aws_route53_record" "openzeppelin_com_defender_auth_aws_certificate_validation" {
  zone_id = "${aws_route53_zone.openzeppelin_com.zone_id}"
  name    = "_f38d05f6f76ea5ea2e9c804d2ff151bc.auth.defender.openzeppelin.com."
  ttl     = 300
  type    = "CNAME"
  records = ["_64f254505c372845c1683143b357b44d.jfrzftwwjs.acm-validations.aws."]
}

resource "aws_route53_record" "openzeppelin_com_defender_auth_alias" {
  zone_id = "${aws_route53_zone.openzeppelin_com.zone_id}"
  name    = "auth.defender.openzeppelin.com."
  type    = "A"
  alias {
    name    = "d16jsayjjd7bde.cloudfront.net"
    zone_id = "Z2FDTNDATAQYW2"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "openzeppelin_com_defender_amazonses_txt" {
  zone_id = "${aws_route53_zone.openzeppelin_com.zone_id}"
  name    = "_amazonses.defender.openzeppelin.com"
  ttl     = "300"
  type    = "TXT"
  records = [
    "mMy9BrFfWdNy21G3lz4ZuzxJdOqsALfQWfXu/vD6n2Y=",
    "DQyoXb6rE3OCJnU1pL6xxlCYDK78TA0fvhf3b7YSIPU="
  ]
}

resource "aws_route53_record" "openzeppelin_com_defender_dkim_1" {
  zone_id = "${aws_route53_zone.openzeppelin_com.zone_id}"
  name    = "csrh5mvpf5fhgrk4sj2gts46n7s2fkoc._domainkey.defender.openzeppelin.com"
  ttl     = 300
  type    = "CNAME"
  records = ["csrh5mvpf5fhgrk4sj2gts46n7s2fkoc.dkim.amazonses.com"]
}

resource "aws_route53_record" "openzeppelin_com_defender_dkim_2" {
  zone_id = "${aws_route53_zone.openzeppelin_com.zone_id}"
  name    = "xwqiui3vs7n756wc24ey4kramuzfoqay._domainkey.defender.openzeppelin.com"
  ttl     = 300
  type    = "CNAME"
  records = ["xwqiui3vs7n756wc24ey4kramuzfoqay.dkim.amazonses.com"]
}

resource "aws_route53_record" "openzeppelin_com_defender_dkim_3" {
  zone_id = "${aws_route53_zone.openzeppelin_com.zone_id}"
  name    = "46yu4ocw773gn7g36dpltes5ifezgmgi._domainkey.defender.openzeppelin.com"
  ttl     = 300
  type    = "CNAME"
  records = ["46yu4ocw773gn7g36dpltes5ifezgmgi.dkim.amazonses.com"]
}

resource "aws_route53_record" "openzeppelin_com_defender_cloudflare-verify-cname" {
  zone_id = "${aws_route53_zone.openzeppelin_com.zone_id}"
  name    = "cloudflare-verify.openzeppelin.com"
  ttl     = 300
  type    = "TXT"
  records = ["461621821-307126714"]
}

resource "aws_route53_record" "openzeppelin_com_docs_defender_certificate_validation" {
  zone_id = "${aws_route53_zone.openzeppelin_com.zone_id}"
  name    = "_2e0748d2059751592c5781c871a4b1ef.docs.defender.openzeppelin.com"
  ttl     = 300
  type    = "CNAME"
  records = ["_6e54810a0a7aadd9a7b07ef24af40af6.bsgbmzkfwj.acm-validations.aws."]
}

resource "aws_route53_record" "openzeppelin_com_docs_defender" {
  zone_id = "${aws_route53_zone.openzeppelin_com.zone_id}"
  name    = "docs.defender.openzeppelin.com"
  ttl     = 300
  type    = "CNAME"
  records = ["openzeppelin-redirections.netlify.app"]
}

resource "aws_route53_record" "openzeppelin_com_slanders_cloudflare_cname" {
  zone_id = "${aws_route53_zone.openzeppelin_com.zone_id}"
  name    = "slanders.openzeppelin.com"
  ttl     = "300"
  type    = "CNAME"
  records = [ "slanders.openzeppelin.com.cdn.cloudflare.net" ]
}

resource "aws_route53_record" "openzeppelin_com_cloudflare_cert_verification_cname_api_defender" {
  zone_id = "${aws_route53_zone.openzeppelin_com.zone_id}"
  name    = "_ca3-04595aa055d2474a870f03d8c6a2fb42.api.defender.openzeppelin.com"
  ttl     = "300"
  type    = "CNAME"
  records = [ "dcv.digicert.com" ]
}

resource "aws_route53_record" "openzeppelin_com_defender_ses_mx" {
  zone_id = "${aws_route53_zone.openzeppelin_com.zone_id}"
  name    = "defender.openzeppelin.com"
  ttl     = "300"
  type    = "MX"
  records = [
    "10 inbound-smtp.us-east-1.amazonaws.com."
  ]
}
