LagMate_UpdateInterval = 5.0;

function LagMate_Update()
  local down, up, lagHome, lagWorld = GetNetStats();
  LagMateButton:SetText(lagWorld);
  LagMateButton2:SetText(lagHome);
  print("Updating latency information" );
end

function LagMate_AutoUpdate(self, elapsed)

  self.TimeSinceLastUpdate = self.TimeSinceLastUpdate + elapsed;

  if (self.TimeSinceLastUpdate > LagMate_UpdateInterval) then
    local down, up, lagHome, lagWorld = GetNetStats();
    LagMateButton:SetText(lagWorld);
    LagMateButton2:SetText(lagHome);
    self.TimeSinceLastUpdate = 0;

    if (lagWorld < 100) then
      LagMateTexture:SetVertexColor(0,1,0,1);
    elseif (lagWorld < 250) then
      LagMateTexture:SetVertexColor(0.5,0.5,0,1);
    else
      LagMateTexture:SetVertexColor(1,0,0,1);
    end
  end
end

SLASH_LAGMATE1, SLASH_LAGMATE2 = '/lag', '/lagmate'; -- 3.
function SlashCmdList.LAGMATE(msg, editbox) -- 4.
  LagMate_PrintLag();
end

function LagMate_PrintLag()
  local down, up, lagHome, lagWorld = GetNetStats();

  print("Connection Lag: "..lagHome.." milliseconds, World Lag: "..lagWorld );
end
