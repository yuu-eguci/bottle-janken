<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="/static/janken.css" media="all">
        <title>BOTTLE SERVER</title>
    </head>

    <body>
        <div class="outer">
            <form action="/" method="post">

                <div class="inner_header" style="text-align:center;">
                    C'mon, J A N K E N...
                </div>

                <div class="inner_body">
                    <div class="shelf">
                        % if hand['mine'] != -1:
                        <button class="hand" style="background-color:orange;">
                            <%
                            hand_mine_name = ''
                            if hand['mine'] == 0:
                                hand_mine_name = '00_rock.png'
                            elif hand['mine'] == 1:
                                hand_mine_name = '01_scissors.png'
                            elif hand['mine'] == 2:
                                hand_mine_name = '02_paper.png'
                            end
                            %>
                            <img src="/static/{{hand_mine_name}}">
                        </button>
                        % end
                    </div>
                    <div class="shelf">
                        % if result != -1:
                            <%
                            result_class = ''
                            result_label = ''
                            if result == 0:
                                result_class = 'draw'
                                result_label = 'DRAW'
                            elif result == 1:
                                result_class = 'lost'
                                result_label = 'YOU LOST..'
                            elif result == 2:
                                result_class = 'won'
                                result_label = 'YOU WON!!'
                            end
                            %>
                            <span class="{{result_class}}">{{result_label}}</span>
                        % end
                    </div>
                    <div class="shelf">
                        <div class="box_row">
                            <div class="button box_row_left" style="background:none;width:40px;">
                                <span style="color:red;">●</span>{{counter['won']}}
                                <input type="hidden" name="won" value="{{counter['won']}}">
                            </div>
                            <div class="button box_row_left" style="background:none;width:40px;">
                                <span style="color:black;">●</span>{{counter['draw'] }}
                                <input type="hidden" name="draw" value="{{counter['draw']}}">
                            </div>
                            <div class="button box_row_left" style="background:none;width:40px;">
                                <span style="color:blue;">●</span>{{counter['lost'] }}
                                <input type="hidden" name="lost" value="{{counter['lost']}}">
                            </div>
                        </div>
                    </div>
                </div>

                <div class="inner_footer">
                    <div class="box_row">
                        <%
                        tmp = ['','','']
                        if hand['his'] != -1:
                            tmp[hand['his']] = 'background-color:orange;'
                        end
                        %>
                        <div class="button box_row_left">
                            <button class="hand" type="submit" name="his" value="0" style="{{tmp[0]}}">
                                <img src="/static/00_rock.png" alt="01_rock">
                            </button>
                        </div>
                        <div class="button box_row_left">
                            <button class="hand" type="submit" name="his" value="1" style="{{tmp[1]}}">
                                <img src="/static/01_scissors.png" alt="02_scissors">
                            </button>
                        </div>
                        <div class="button box_row_left">
                            <button class="hand" type="submit" name="his" value="2" style="{{tmp[2]}}">
                                <img src="/static/02_paper.png" alt="03_paper">
                            </button>
                        </div>
                    </div>
                </div>

            </form>
        </div>
    </body>
</html>