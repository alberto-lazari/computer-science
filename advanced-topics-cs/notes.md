# Protocols
Have to be sound and robust in the design, otherwise all implementation will be unsecure

## Kerberos - Needham & Schröder
1. `encrypt A.id, N_A, with: B.public_key |> A.send B`: A sends B its id and a random number `N_A`, encrypted with B's public key
2. `encrypt N_A, N_B, with: A.public_key |> B.send A`: B sends back to A its `N_A` (decrypted with B's private key) and another `N_B`
3. `encrypt N_B, with: B.public_key |> A.send B`: A sends back to B its`N_B` (decrypted with A's private key)

After 1, 2 and 3 A and B think they are talking to one another

### Man in the middle attack
C is in the middle of A and B and recreates the protocol -> kerberos is not secure

# Messages and deduction
