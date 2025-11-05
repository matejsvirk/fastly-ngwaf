resource "fastly_ngwaf_workspace_rule" "exclude_xss_signal" {
  workspace_id    = fastly_ngwaf_workspace.waf.id
  type            = "signal"
  description     = "Exclude XSS signal to address a false positive"
  enabled         = true
  group_operator  = "all"

  condition {
    field    = "path"
    operator = "like"
    value    = "/contact-form"
  }
  action {
    type   = "exclude_signal"
    signal = "XSS"
  }
}
