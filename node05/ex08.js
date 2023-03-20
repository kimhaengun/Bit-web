//class 
class Cl01{
    constructor(name, year){
        this.name = name;
        this.year = year;
    }
    func() {
        console.log('Cl01 func ~~~~~');
    }
}

class Cl03 extends Cl01{
    constructor(name, year){
        super(name,year);
    }
}

function Cl02(a,b){
    this.name=a;
    this.year=b;
    this.func = ()=>{
        console.log('Cl02 func~~~~');
    }
}

let obj1 = new Cl03('user1',2000);
obj1.func();
console.log(obj1.name, obj1.year);
