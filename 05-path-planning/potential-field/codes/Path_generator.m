function [P, reached] = Path_generator(xs, xf, eta, B)

    eps_step  = 0.1;     
    tol_goal  = 0.1;     
    maxIter   = 50000;  
    minForce  = 1e-8;    

    x = xs(:).';         
    xf = xf(:).';

    P = x;
    reached = false;

    for it = 1:maxIter
        if norm(x - xf) < tol_goal
            reached = true;
            break;
        end

        F = eta * (xf - x);

        for i = 1:size(B,1)
            a = B(i,1:2);           
            b = B(i,3:4);          
            d0 = B(i,5);            
            alpha = B(i,6);         

            [q, d, v] = closestPointOnSegment(x, a, b); 

            if d < 1e-12
                v = x - (a+b)/2;
                d = norm(v) + 1e-12;
            end

            if d <= d0
                F_rep = alpha * ( (1/d) - (1/d0) ) * (1/(d^3)) * v;
                F = F + F_rep;
            end
        end

        Fnorm = norm(F);
        if Fnorm < minForce
            break;
        end

        x = x + eps_step * (F / Fnorm);
        P = [P; x]; 
    end

    if reached
        P = [P; xf];
    end
end

function [q, d, v] = closestPointOnSegment(x, a, b)
    ab = b - a;
    denom = dot(ab, ab);

    if denom < 1e-12
        q = a;
    else
        t = dot(x - a, ab) / denom;
        t = max(0, min(1, t));  
        q = a + t * ab;
    end

    v = x - q;
    d = norm(v);
end
