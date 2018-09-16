<h1>YO {{name}}!</h1>

<ul>
% for i in range(5):
    <li>{{i}}</li>
% end
</ul>

% if a['1'] == 'AAA':
    <p>わーい <% if a['b'] == 'BBB': %>CCC<% end %></p>
% else:
    <p>うひょ</p>
% end
