package main

import (
	"fmt"
	"syscall/js"
)

func runCode(this js.Value, inputs []js.Value) interface{} {
	code := inputs[0].String()
	fmt.Println("Received code:", code)
	return nil
}

func registerCallbacks() {
	js.Global().Set("runCode", js.FuncOf(runCode))
}

func main() {
	c := make(chan struct{}, 0)
	registerCallbacks()
	<-c
}
