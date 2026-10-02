% plot_mats.m
% Plota todos os sinais de todos os .mat da pasta "variaveis".
% Uma figura por arquivo. Sinais discretos (zoh) saem com stairs.

pasta = 'variaveis';
arqs  = dir(fullfile(pasta, '*.mat'));

if isempty(arqs)
    error('Nenhum .mat encontrado em "%s".', pasta);
end

for k = 1:numel(arqs)
    S      = load(fullfile(pasta, arqs(k).name));
    campos = fieldnames(S);

    fig = figure('Name', arqs(k).name);
    theme(fig, 'light')
    hold on, grid on

    for c = 1:numel(campos)
        v = S.(campos{c});

        if isa(v, 'Simulink.SimulationData.Dataset')
            for i = 1:v.numElements
                el   = v.getElement(i);
                nome = el.Name;
                if isempty(nome), nome = sprintf('%s_%d', campos{c}, i); end
                plotSinal(el.Values, nome)
            end

        elseif isa(v, 'timeseries')
            plotSinal(v, campos{c})
        end
    end

    xlabel('t (s)')
   % title(arqs(k).name, 'Interpreter', 'none')
    legend('show', 'Interpreter', 'none')
    hold off
end

% ---------------------------------------------------------------------
function plotSinal(ts, nome)
if ~isa(ts, 'timeseries'), return, end   % ignora buses/outros tipos

y = squeeze(ts.Data);
if size(y, 1) ~= numel(ts.Time), y = y.'; end

if strcmpi(ts.DataInfo.Interpolation.Name, 'zoh')   % sinal discreto
    stairs(ts.Time, y, 'DisplayName', nome)
else
    plot(ts.Time, y, 'DisplayName', nome)
end
end