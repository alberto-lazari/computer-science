let f (x : int) : unit = printfn "1. f"
f 1

// unit -> unit
let g () = printfn "2. g"
g ()

// ('a -> 'b) -> 'a list -> 'b list
printfn "3. %O" (List.map (fun x -> x > 2) [1 .. 10])

// ('b -> 'a -> 'b) -> 'b -> 'a list -> 'b
printfn "4. %O" (List.fold (fun s x -> if x % 2 = 0 then 'a' else 'b') 'a' [1 .. 5])

// int -> int
printfn "5. %d" ((fun (1 | _) -> 3) 1)

// int -> int
let h x = match x with
            | 1 -> 2
            | 2 -> 3
            | _ -> 0
printfn "6. %d" (h 3)

// ('a -> bool) -> 'a list -> 'a list
let filter f l = List.fold (fun s x -> if f x then s @ [x] else s) [] l
printfn "7. %O" (filter (fun x -> x = 4) [1 .. 10])
printfn "8. %O" (List.filter (fun c -> c > 'a') ['a'; 'b'; 'c'])

let (+=) x y = x + y
let (++) = (+) 1 in printfn "9. %d" ((++) 3)

printfn "10. %f" 1f

printfn "11. %d" (int (3f / 2f))

printf "12."
List.iter2 (fun n a -> printf " %O" (n, a)) [1 .. 3] ['a' .. 'c']

printfn ""
