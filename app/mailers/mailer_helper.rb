# frozen_string_literal: true

module MailerHelper
  def mailer_paragraph
    content_tag('p', style: "font-family: 'Open Sans', 'Helvetica Neue', Arial, sans-serif; font-size: 14px; font-weight: normal; margin: 0; margin-bottom: 15px;") do
      yield
    end
  end

  def mailer_divider
    html = <<-HTML
      <table border="0" cellpadding="0" cellspacing="0" class="hr" style="border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%;" width="100%">
        <tbody>
          <tr>
          <td style="font-family: sans-serif; font-size: 14px; vertical-align: top; height: 20px; line-height: 20px;" valign="top">&nbsp;</td>
        </tr>
        <tr>
          <td height="1" style="font-family: sans-serif; font-size: 14px; vertical-align: top; background-color: #f6f6f6; height: 1px; line-height: 1px; width: 100%;" width="100%" valign="top" bgcolor="#f6f6f6"></td>
        </tr>
        <tr>
          <td style="font-family: sans-serif; font-size: 14px; vertical-align: top; height: 20px; line-height: 20px;" valign="top">&nbsp;</td>
        </tr>
          </tbody>
      </table>
    HTML
    html.html_safe
  end

  def mailer_spacer
    html = <<-HTML
      <table border="0" cellpadding="0" cellspacing="0" class="hr" style="border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%;" width="100%">
        <tbody>
          <tr>
            <td style="font-family: sans-serif; font-size: 14px; vertical-align: top; height: 20px; line-height: 20px;" valign="top">&nbsp;</td>
          </tr>
        </tbody>
      </table>
    HTML
    html.html_safe
  end

  def mailer_button(text, url, align = 'left', background = '#f1d326e8')
    %(<table border="0" cellpadding="0" cellspacing="0" class="btn btn-primary" style="border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%; box-sizing: border-box; min-width: 100% !important;" width="100%">
      <tbody>
        <tr>
          <td align="#{align}" style="font-size: 14px; vertical-align: top;" valign="top">
            <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: auto;">
              <tbody>
                <tr>
                  <td style="font-family: 'Open Sans', 'Helvetica Neue', Arial, sans-serif; font-size: 14px; vertical-align: top; background-color: #{background}; border-radius: 5px; text-align: center;" valign="top" bgcolor="#3498db" align="center">
                    <a href="#{url}" target="_blank" style="display: inline-block; color: #555; background-color: #{background}; border: solid 2px #{background}; border-radius: 5px; box-sizing: border-box; cursor: pointer; text-decoration: none; font-size: 14px; font-weight: bold; margin: 0; padding: 12px 25px; text-transform: capitalize; border-color: #{background};">
                      #{text}
                    </a>
                  </td>
                </tr>
              </tbody>
            </table>
          </td>
        </tr>
      </tbody>
    </table>).html_safe
  end

  def mailer_error_button(text, url, align = 'left')
    %(<table border="0" cellpadding="0" cellspacing="0" class="btn btn-error" style="border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%; box-sizing: border-box; min-width: 100% !important;" width="100%">
      <tbody>
        <tr>
          <td align="#{align}" style="font-size: 14px; vertical-align: top;" valign="top">
            <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: auto;">
              <tbody>
                <tr>
                  <td style="font-family: 'Open Sans', 'Helvetica Neue', Arial, sans-serif; font-size: 14px; vertical-align: top; background-color: #EF634A; border-radius: 5px; text-align: center;" valign="top" bgcolor="#3498db" align="center">
                    <a href="#{url}" target="_blank" style="display: inline-block; color: #FFF; background-color: #EF634A; border: solid 2px #EF634A; border-radius: 5px; box-sizing: border-box; cursor: pointer; text-decoration: none; font-size: 14px; font-weight: bold; margin: 0; padding: 12px 25px; text-transform: capitalize; border-color: #EF634A;">
                      #{text}
                    </a>
                  </td>
                </tr>
              </tbody>
            </table>
          </td>
        </tr>
      </tbody>
    </table>).html_safe
  end
end
