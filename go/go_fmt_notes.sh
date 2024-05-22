https://pkg.go.dev/fmt

fmt.Print("")
fmt.Printf("")
fmt.Println("")

func Fprint(w io.Writer, a ...any) (n int, err error)
func Fprintf(w io.Writer, format string, a ...any) (n int, err error)
func Fprintln(w io.Writer, a ...any) (n int, err error)

%d           decimal integer
%x, %o, %b   integer in hexade cimal, o c t al, binar y
%f, %g, %e   floating-p oint numb er : 3.141593 3.141592653589793 3.141593e+00 
%t           boolean: true or false
%c           rune (Unico decode point)
%s           string
%q           quoted string "abc" or rune 'c'
%v           any value in a natural format
%T           type of any value
%%           literal p ercent sig n (no op erand)
