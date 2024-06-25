https://pkg.go.dev/encoding/json

# convert go struct to JSON string
json.Marshal

# produces neatly indented output
json.MarshalIndent
json.MarshalIndent(movies, "", "    ")

# convert JSON string to go struct
json.Unmarshal


json.NewDecoder()


type Movie struct {
    Title  string
    Year   int  `json:"released"`
    Color  bool `json:"color,omitempty"`
    Actors []string
}