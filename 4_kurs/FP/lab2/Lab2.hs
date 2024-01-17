module Main (main) where
type TheInt = Int
type TheBool = Bool
type TheChar = Char
type TheFloat = Float
type TheDouble = Double
diff:: TheInt->TheInt->TheInt
diff x y = x - y
data Person a b c = Person{
    name :: a,
    age :: b,
    height :: c
} deriving(Show)
printHumanName (Person {name=a, age=b, height=c}) = 
    do
        print a
        print b 
        print c
main = do {
    print (diff 66 6);
    let human = Person{name="Rust", age=30, height=1.82};
    in printHumanName human; 
}
