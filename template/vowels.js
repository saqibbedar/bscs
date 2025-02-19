const count = (str) => {
    var x = 0;
    for (let i = 0; i < str.length; ++i){
        if ("aeiouAEIOU".includes(str[i])) x += 1;
    }
    return x;
}

console.log(count("saqib"));
