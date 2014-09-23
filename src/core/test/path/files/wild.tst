/*
    Test wild card patterns via files()
 */

let d = Path()

//  Wild card patterns
assert(d.files('file.dat') == 'file.dat')
assert(d.files('*file.dat').sort() == 'file.dat,pre-file.dat')
assert(d.files('*le.dat').sort() == 'file.dat,pre-file.dat')
assert(d.files('*file.dat*').sort() == 'file.dat,pre-file.dat')
assert(d.files('*file.d*').sort() == 'file.dat,pre-file.dat')
assert(d.files('file*.dat').sort() == 'file-post.dat,file.dat')
assert(d.files('fi*.dat').sort() == 'file-post.dat,file.dat')
assert(d.files('file.*dat') == 'file.dat')
assert(d.files('file.*at') == 'file.dat')
assert(d.files('file.???').sort() == 'file.dat')
assert(d.files('f?l?.dat') == 'file.dat')

//  Must not match
assert(d.files('zle.dat') == '')
assert(d.files('file.datx') == '')
assert(d.files('file*.t') == '')

//  Directory matching
assert(d.files('*').length > 4)
assert(d.files('*').contains(Path('mid')))
assert(!d.files('*').contains(Path('mid/middle.dat')))
assert(!d.files('*').contains(Path('mid/sub1')))
assert(!d.files('*').contains(Path('mid/sub2')))

//  Directory wildcards
assert(d.files('mid/su*/lea*').length == 4)

//  Trailing slash matches only directories
assert(d.files('*/') == 'mid')

//  Double star 
assert(d.files("**/*.dat").length > 8)
assert(d.files("**").length > 8)
assert(d.files("**").contains(Path('mid')))
assert(d.files("**").contains(Path('file.dat')))

//  Directories only
assert(d.files("**/").length == 3)
assert(d.files("**/").contains(Path('mid')))
assert(!d.files("**/").contains(Path('file.dat')))

//  Double star with suffix
assert(d.files("**.dat").length > 8)

//  Start with a base path 
assert(Path('../files').files('mid/*.dat') == '../files/mid/middle.dat')
