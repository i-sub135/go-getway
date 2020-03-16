package addone

// CheckMode -- cek mode fungsion
func CheckMode(mode string) string {
	switch mode {
	case "dev":
		return "development"
	case "prod":
		return "production"
	case "stg":
		return "staging"
	default:
		return "development"

	}
}
