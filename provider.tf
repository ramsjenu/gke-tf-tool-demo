provider "google" {
  credentials = file("./creds/serviceaccount.json")
  project     = "vrams-project"
  region      = "europe-west1"
}
