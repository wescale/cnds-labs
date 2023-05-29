package main

denylist = ["debian"]

deny[msg] {
	input[i].Cmd == "from"
	val := input[i].Value
	contains(val[i], denylist[_])

	msg = sprintf("Denied base image found %s", [val])
}