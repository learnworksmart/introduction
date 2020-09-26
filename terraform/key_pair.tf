resource "aws_key_pair" "base_key_pair" {
  key_name   = "learnworksmart"
  public_key = file(var.pubkey)
}
