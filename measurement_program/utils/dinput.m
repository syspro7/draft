function [out] = dinput(varargin)

    if nargin == 2
        prompt = varargin{1};
        varname = varargin{2};
    else
        prompt = varargin{1};
        s      = varargin{2};
        varname = varargin{3};
    end
    
    try
        default = evalin('caller', varname);
    catch ex 
    end
    
    if exist('ex', 'var') % varname not exist in workspace
        if exist('s', 'var')
            out = input(sprintf('%s >> ', prompt), s);
        else
            out = input(sprintf('%s >> ', prompt)   );
        end
    else
        if exist('s', 'var')
            out = input(sprintf('%s (default: %s) >> ', prompt, default), s);
        else
            out = input(sprintf('%s (default: %d) >> ', prompt, default)   );
        end
        
        if isempty(out)
            out = default;
        end
    end
    
end