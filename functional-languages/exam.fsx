// Albero n-ario
// Valori sulle foglie
// Funzioni di utilità

type 'a nTree =
    | Node of 'a * 'a nTree list

let tree = Node (1, [Node (2, []); Node (3, [])])

// pretty print
let rec print t =
    match t with
    | Node (x, []) -> sprintf "%O" x
    | Node (x, ns) -> sprintf "(%O, %O)" x (List.map (fun n -> print n) ns)

print tree |> printfn "%s"

// map
let rec map f t =
    match t with
    | Node (x, []) -> Node (f x, [])
    | Node (x, ns) -> Node (f x, List.map (fun n -> map f n) ns)

print (map (fun x -> x + 1) tree) |> printfn "%s"

// sum
let rec sum (+) t =
    match t with
    | Node (x, []) -> x
    | Node (x, ns) -> List.fold (fun s n -> s + (sum (+) n)) x ns

sum (+) tree |> printfn "%d"

// fold
//let rec foldL f z t =
//    match t with
//    | Node (x, []) -> z
//    | Node (x, l) -> List.map (fun n -> foldL f (f x) n) l
