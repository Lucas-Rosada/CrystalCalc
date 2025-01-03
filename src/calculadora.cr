require "kemal"

get "/" do |env|
  a_str = env.params.query["a"]? || "0.0"
  b_str = env.params.query["b"]? || "0.0"
  op    = env.params.query["op"]? || "+"
  a = a_str.to_f
  b = b_str.to_f

  r = case op
      when "+" then a + b
      when "-" then a - b
      when "*" then a * b
      when "/" then a / b
      else 0
      end

  <<-HTML
    <div style="
    width:300px;
    margin:30px auto;
    padding:20px;
    box-shadow:0 0 8px #999;
    text-align:center;">
      <form>
        <input name="a" placeholder="A" />
        <br><br>
        <select name="op">
          <option>+</option>
          <option>-</option>
          <option>*</option>
          <option>/</option>
        </select>
        <br><br>
        <input name="b" placeholder="B" />
        <br><br>
        <button>Calcular</button>
      </form>
      <p>Resultado: #{r}</p>
    </div>
  HTML
end

Kemal.run
