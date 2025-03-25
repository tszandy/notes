# unselect the selection.
const handleChange=(e)=>{
    otherdatachange
    const selectedOptions = Array.from(e.target.selectedOptions)
    selectedOptions.forEach(option=>{option.selected=false})
}

<select onChange={handleChange}>
<option value="1">1</option>
<option value="2">2</option>
<option value="3">3</option>
</select>