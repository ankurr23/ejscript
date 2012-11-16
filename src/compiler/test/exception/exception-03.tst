/*
  	Test finally runs when no catch block is declared
 */

var state

try {
	state = 1

} finally {
	assert(state == 1)
	state = 2
}

assert(state == 2)
