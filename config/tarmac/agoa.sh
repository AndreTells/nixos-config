usql redshift://$(pass analytics/uname):$($(dirname "$0")/get_analytics_password.sh)@$(pass analytics/uri):5439/agoa -x "$@"
