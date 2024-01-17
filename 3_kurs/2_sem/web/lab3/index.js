const { randomUserMock, additionalUsers } = require('./FE4U-Lab3-mock.js')
const speciality = ["Mathematics", "Physics", "English", "Computer Science", "Dancing", "Chess", "Biology", "Chemistry", "Law", "Art", "Medicine", "Statistics"]
const formateList = [ "id", "gender", "title" , "full_name", "city", "state", "country" , "postcode", "coordinates", "timezone", "email", "b_day", "age", "phone", "picture_Large", "picture_thumbnail", "favorite" , "course", "bg_color", "note" ]  

var listOfUsers = task1()
console.clear()

function task1 () {

    var getRandomSpeciality = items => {
        return items[~~(items.length * Math.random())]
    };

    var repeatableObject = (List, Obj) => {
        for (email of List) {
            if (email["email"] === Obj["email"] && Obj["email"] != null) {
                console.log(item["email"] + " " + Obj["email"])
                return true
            }
        }
        console.log("false")
        return false
    }

    var newListOfUsers = randomUserMock.map(el => {
        return {
            "id": randomUserMock.indexOf(el) + 1,
            "gender": el.gender,
            "title": el.name.title,
            "full_name": el.name.first + " " + el.name.last,
            "city": el.location.city,
            "state": el.location.state,
            "country": el.location.country,
            "postcode": + el.location.postcode,
            "coordinates": el.location.coordinates,
            "timezone": el.location.timezone,
            "email": el.email,
            "b_day": el.dob.date,
            "age": + el.dob.age,
            "phone": el.phone,
            "picture_Large": el.picture.large,
            "picture_thumbnail": el.picture.thumbnail,
            "favorite": false,
            "course": getRandomSpeciality(speciality),
            "bg_color": null,
            "note": null
        }
    });

    for (item of additionalUsers) {
        for (prop of formateList) {
            if (!item.hasOwnProperty(prop)) {
                item[prop] = undefined
            }
        }
        item["id"] = newListOfUsers.length + 1
        if (item["course"] === undefined) {
            item["course"] = getRandomSpeciality(speciality)
        }
        if (repeatableObject(newListOfUsers, item) === false) {
            newListOfUsers.push(item)
        }
    }
    
    return newListOfUsers
}

//console.log(listOfUsers);

function task2(user){
    function testUppercase(prop){
        if (prop == null || prop == undefined) return false;
        return /^[A-Z\p{Lu}]/u.test(prop);
    }

    let name = user["full_name"].split(' ')[0];
    let surname = user["full_name"].split(' ')[1];

    let regexName = testUppercase(name) && testUppercase(surname);
    let regexSex = testUppercase(user["gender"]);
    let regexNote = testUppercase(user["note"]);
    let regexState = testUppercase(user["state"]);
    let regexCity = testUppercase(user["city"]);
    let regexCountry = testUppercase(user["country"]);

    if(!regexName || !regexSex || !regexNote || !regexState || !regexCity || !regexCountry){
        return false;
    }

    if(isNaN(user["age"])){
        return false;
    }

    if(!/\d{3}-\d{3}-\d{4}/.test(user["phone"])){
        return false;
    }

    if(!/[a-z0-9._%+-]+@gmail.com/.test(user["email"])){
        return false;
    }

    return true;
}
 
function task3(users, country, age, gender, favorite) {
    let filtred = users.filter(user => user["age"]      == age && 
                                       user["gender"]   == gender &&
                                       user["country"]  == country &&
                                       user["favorite"] == favorite)
    return filtred
}

//console.log(task3(listOfUsers, 'Norway', 69, 'female', false));

function task4(users, sortProp, isDescending = false) {

    if (sortProp == 'age') 
        users.sort((a, b) => a[sortProp] - b[sortProp])
    else if (sortProp == 'b_day') 
        users.sort((a, b) => new Date(a) - new Date(b))
    else
        users.sort((a, b) => {
            if (a[sortProp] > b[sortProp]) return 1
            if (a[sortProp] < b[sortProp]) return -1
        })
    
    if (isDescending) users.reverse()     

    return users
}

//console.log(task4(listOfUsers, 'age'));

function task5(users, searchField) {

    function checkProps(el) {
        if (el["full_name"] !== null) 
        {
            if(el["full_name"].includes(searchField)) return true
        }
        if (el["note"] !== null) 
        {
            if(el["note"].includes(searchField)) return true
        }
        if (el["age"] !== null) 
        {
            if(String(el["age"]).includes(searchField)) return true
        }
        return false
    }

    searched = users.filter(checkProps)

    return searched
}

function task6 (filtredUsers, allUsers) {
    return (filtredUsers.length/allUsers.length * 100).toFixed(2)
}

console.log(task5(listOfUsers, "en"))
console.log(task6(task5(listOfUsers, "en"), listOfUsers))