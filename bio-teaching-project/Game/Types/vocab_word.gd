class_name VocabWord
extends Node

var word_name: String
var definition: String

func add_vocab(word: String):
	word_name = word
	definition = VocabList.vocab[word]
